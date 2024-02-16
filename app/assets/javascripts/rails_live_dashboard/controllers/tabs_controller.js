import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static classes = ["active"];
  static targets = ["button", "tab"];
  static values = { defaultTab: String };

  connect() {
    this.tabTargets.map((tab) => {
      if (tab.id != this.defaultTabValue) {
        tab.hidden = true;
      }
    });

    this.buttonTargets.find((button) => {
      if (button.id === this.defaultTabValue) {
        button.classList.add(...this.activeClasses);
      }
    });
  }

  select(event) {
    let selectedTab = this.tabTargets.find(
      (element) => element.id === event.currentTarget.id
    );

    if (selectedTab.hidden) {
      this.tabTargets.map((tab) => (tab.hidden = true));
      this.buttonTargets.map((button) =>
        button.classList.remove(...this.activeClasses)
      );

      selectedTab.hidden = false;
      event.currentTarget.classList.add(...this.activeClasses);
    }
  }
}
