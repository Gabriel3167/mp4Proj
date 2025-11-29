package controllers;

public class Grade {
    private String name;
    private double units;
    private double grade;

    public Grade(String name, double units, double grade) {
        this.name = name;
        this.units = units;
        this.grade = grade;
    }

    // Getters are required for JSP to read the data later
    public String getName() { return name; }
    public double getUnits() { return units; }
    public double getGrade() { return grade; }
}