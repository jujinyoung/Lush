package event.domain;

public class Eventlist {

    private Event event;
    private int review;

    public Eventlist(Event event, int review) {
        this.event = event;
        this.review = review;
    }

    public Event getEvent() {
        return event;
    }

    public int getReview() {
        return review;
    }
}
