package event.domain;

import java.util.Date;

public class EventReview {

    private int er_id;
    private int ev_id;
    private int me_id;
    private String er_secret;
    private String er_content;
    private String er_rdate;

    public EventReview() {
    }

    public EventReview( int ev_id, int me_id, String er_secret, String er_content) {
        this.ev_id = ev_id;
        this.me_id = me_id;
        this.er_secret = er_secret;
        this.er_content = er_content;
        this.er_rdate = er_rdate;
    }

    public EventReview(int er_id, int ev_id, int me_id, String er_secret, String er_content, String er_rdate) {
        this.er_id = er_id;
        this.ev_id = ev_id;
        this.me_id = me_id;
        this.er_secret = er_secret;
        this.er_content = er_content;
        this.er_rdate = er_rdate;
    }

    public int getEr_id() {
        return er_id;
    }

    public int getEv_id() {
        return ev_id;
    }

    public int getMe_id() {
        return me_id;
    }

    public String getEr_secret() {
        return er_secret;
    }

    public String getEr_content() {
        return er_content;
    }

    public String getEr_rdate() {
        return er_rdate;
    }

    public void setEr_id(int er_id) {
        this.er_id = er_id;
    }
}
