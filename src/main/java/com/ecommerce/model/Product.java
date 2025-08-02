package com.ecommerce.model;

   public class Product {
    private int id;
    private String name;
    private double price;
    private String image;
    private String description;

    // Default constructor
    public Product() {}

    // Parameterized constructor
    public Product(int id, String name, double price, String image, String description) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.image = image;
        this.description = description;
    }

    // Getters
    public int getId() { return id; }
    public String getName() { return name; }
    public double getPrice() { return price; }
    public String getImage() { return image; }
    public String getDescription() { return description; }

    // Setters
    public void setId(int id) { this.id = id; }
    public void setName(String name) { this.name = name; }
    public void setPrice(double price) { this.price = price; }
    public void setImage(String image) { this.image = image; }
    public void setDescription(String description) { this.description = description; }

    // toString() (optional)
    @Override
    public String toString() {
        return "Product{" +
            "id=" + id +
            ", name='" + name + '\'' +
            ", price=" + price +
            ", image='" + image + '\'' +
            ", description='" + description + '\'' +
            '}';
    }
}
