package event.domain;

public class EventResultTitle {

    private EventResult eventResult;
    private String ev_title;

    public EventResultTitle(EventResult eventResult, String ev_title) {
        this.eventResult = eventResult;
        this.ev_title = ev_title;
    }

    public EventResult getEventResult() {
        return eventResult;
    }

    public String getEv_title() {
        return ev_title;
    }
}
