import unittest

from liveextract import enumerate_extractions, exact_schedule, parse_instance, replay_schedule, selected_map


def n(i, children, cost, size):
    return {"id": i, "children": children, "cost": cost, "size": size, "op": i}


class OracleTests(unittest.TestCase):
    def test_chain_exact_cost_and_peak(self):
        raw = {
            "roots": [2],
            "classes": {
                "0": [n("in", [], 0, 0)],
                "1": [n("a", [0], 3, 4)],
                "2": [n("r", [1], 2, 1)],
            },
        }
        classes, roots = parse_instance(raw)
        ext = enumerate_extractions(classes, roots)[0]
        result = exact_schedule(selected_map(classes, ext), roots, 5)
        self.assertEqual(result["total_execution_cost"], 5)
        self.assertEqual(result["peak_live"], 5)

    def test_budget_infeasible(self):
        raw = {
            "roots": [2],
            "classes": {
                "0": [n("in", [], 0, 0)],
                "1": [n("a", [0], 3, 4)],
                "2": [n("r", [1], 2, 1)],
            },
        }
        classes, roots = parse_instance(raw)
        ext = enumerate_extractions(classes, roots)[0]
        self.assertIsNone(exact_schedule(selected_map(classes, ext), roots, 4))

    def test_delete_and_recompute_replay(self):
        raw = {
            "roots": [3],
            "classes": {
                "0": [n("in", [], 0, 0)],
                "1": [n("a", [0], 1, 1)],
                "2": [n("b", [1], 1, 1)],
                "3": [n("r", [1, 2], 1, 1)],
            },
        }
        classes, roots = parse_instance(raw)
        ext = enumerate_extractions(classes, roots)[0]
        sel = selected_map(classes, ext)
        replay = replay_schedule(sel, roots, ["C:1", "C:2", "D:1", "C:1", "C:3"])
        self.assertEqual(replay["recomputation_count"], 1)
        self.assertEqual(replay["total_execution_cost"], 4)

    def test_extraction_closure_deduplicates_unreachable_choices(self):
        raw = {
            "roots": [2],
            "classes": {
                "0": [n("in", [], 0, 0)],
                "1": [n("unused1", [0], 1, 1), n("unused2", [0], 2, 1)],
                "2": [n("r", [0], 1, 1)],
            },
        }
        classes, roots = parse_instance(raw)
        self.assertEqual(len(enumerate_extractions(classes, roots)), 1)


if __name__ == "__main__":
    unittest.main()
