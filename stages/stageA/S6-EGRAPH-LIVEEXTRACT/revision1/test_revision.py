import json
import unittest
from pathlib import Path

from oracle_revision import enumerate_extractions, exact_schedule, parse_projection, replay_schedule, selected_map


ROOT = Path(__file__).parent


class RevisionOracleTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.raw = json.loads((ROOT / "inputs" / "locked_natural_projection.json").read_text())
        cls.classes, cls.roots = parse_projection(cls.raw)
        cls.extractions = enumerate_extractions(cls.classes, cls.roots)

    def test_natural_multi_extraction(self):
        self.assertGreaterEqual(len(self.extractions), 2)
        self.assertEqual(self.roots, ("7",))

    def test_projection_mapping(self):
        self.assertEqual(self.raw["source"]["raw_sha256"], "8301352a6b70d0d79bd0eeecfdff39081e3f565b000ccabc8ba5ca63653b05d8")
        self.assertTrue(any(len(nodes) > 1 for nodes in self.classes.values()))
        self.assertTrue(all(n.size in (0, 4, 16) for nodes in self.classes.values() for n in nodes))

    def test_exact_schedule_replay(self):
        extraction = self.extractions[0]
        selected = selected_map(self.classes, extraction)
        result = exact_schedule(selected, self.roots, 256)
        self.assertIsNotNone(result)
        replay = replay_schedule(selected, self.roots, result["actions"])
        self.assertEqual(replay["total_target_operation_millicost"], result["total_target_operation_millicost"])
        self.assertEqual(replay["peak_live_bytes"], result["peak_live_bytes"])

    def test_exact_controls_exist(self):
        runtime = min(x.static_cost for x in self.extractions)
        memory = min(x.one_shot_peak for x in self.extractions)
        self.assertTrue(any(x.static_cost == runtime for x in self.extractions))
        self.assertTrue(any(x.one_shot_peak == memory for x in self.extractions))


if __name__ == "__main__":
    unittest.main()
