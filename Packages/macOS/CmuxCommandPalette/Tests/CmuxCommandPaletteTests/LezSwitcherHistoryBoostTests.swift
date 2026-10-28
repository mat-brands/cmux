import Testing

@testable import CmuxCommandPalette

// cmux Lez: tab rows in the switcher keep their last-used order, so palette usage gives them no boost.
struct LezSwitcherHistoryBoostTests {
    @Test func tabRowsGetNoHistoryBoostButOtherRowsDo() {
        let used = CommandPaletteUsageEntry(useCount: 5, lastUsedAt: 1_000)
        let history = ["switcher.surface.abc": used, "switcher.workspace.abc": used]
        #expect(CommandPaletteSearchOrchestrator.historyBoost(for: "switcher.surface.abc", queryIsEmpty: true, history: history, now: 1_000) == 0)
        #expect(CommandPaletteSearchOrchestrator.historyBoost(for: "switcher.workspace.abc", queryIsEmpty: true, history: history, now: 1_000) > 0)
    }
}
