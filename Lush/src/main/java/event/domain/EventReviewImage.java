package event.domain;

public class EventReviewImage {

    private int eri_id;
    private int er_id;
    private int me_id;
    private String eri_image;

    public EventReviewImage(int eri_id, int er_id, int me_id, String eri_image) {
        this.eri_id = eri_id;
        this.er_id = er_id;
        this.me_id = me_id;
        this.eri_image = eri_image;
    }

    public int getEri_id() {
        return eri_id;
    }

    public int getEr_id() {
        return er_id;
    }

    public int getMe_id() {
        return me_id;
    }

    public String getEri_image() {
        return eri_image;
    }
}
