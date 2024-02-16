import { application } from "./application";
import Reveal from "./reveal_controller";
import Tabs from "./tabs_controller";

application.register("reveal", Reveal);
application.register("tabs", Tabs);
