package event.domain;

public class EventResult {

    private int ev_id;
    private String es_content;
    private String es_rdate;
    private int es_readed;

    public EventResult(int ev_id, String es_content, String es_rdate, int es_readed) {
        this.ev_id = ev_id;
        this.es_content = es_content;
        this.es_rdate = es_rdate;
        this.es_readed = es_readed;
    }

    public int getEv_id() {
        return ev_id;
    }

    public String getEs_content() {
        return es_content;
    }

    public String getEs_rdate() {
        return es_rdate;
    }

    public int getEs_readed() {
        return es_readed;
    }
}
