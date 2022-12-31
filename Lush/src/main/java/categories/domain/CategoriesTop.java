package categories.domain;

public class CategoriesTop {

    private Categories categories;
    private int categories2Record;

    public CategoriesTop(Categories categories, int categories2Record) {
        this.categories = categories;
        this.categories2Record = categories2Record;
    }

    public Categories getCategories() {
        return categories;
    }

    public int getCategories2Record() {
        return categories2Record;
    }

    public void setCategories2Record(int categories2Record) {
        this.categories2Record = categories2Record;
    }
}
