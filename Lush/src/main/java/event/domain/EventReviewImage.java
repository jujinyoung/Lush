package event.domain;

import java.util.ArrayList;
import java.util.Date;

public class EventReviewImage {

    private EventReview eventReview;

    private ArrayList<String> imgPath;


    public EventReviewImage(EventReview eventReview, ArrayList<String> imgPath) {
        this.eventReview = eventReview;
        this.imgPath = imgPath;
    }

    public EventReview getEventReview() {
        return eventReview;
    }

    public ArrayList<String> getImgPath() {
        return imgPath;
    }
}
