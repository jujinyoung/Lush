package event.domain;

import java.util.Date;

public class Event {

    private long id;
    private String image;
    private String title;
    private String subtitle;
    private String notice;
    private String rdate;
    private String edate;

    public Event(long id, String image, String title, String subtitle, String notice, String rdate, String edate) {
        this.id = id;
        this.image = image;
        this.title = title;
        this.subtitle = subtitle;
        this.notice = notice;
        this.rdate = rdate;
        this.edate = edate;
    }

    public long getId() {
        return id;
    }

    public String getImage() {
        return image;
    }

    public String getTitle() {
        return title;
    }

    public String getSubtitle() {
        return subtitle;
    }

    public String getNotice() {
        return notice;
    }

    public String getRdate() {
        return rdate;
    }

    public String getEdate() {
        return edate;
    }
}
