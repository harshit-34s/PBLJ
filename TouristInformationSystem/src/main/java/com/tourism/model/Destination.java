package com.tourism.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Model representing a tourist destination.
 * Holds all destination attributes parsed from the XML data store.
 */
public class Destination implements Serializable {
    private static final long serialVersionUID = 1L;

    private String id;
    private String name;
    private String city;
    private String state;
    private String category;
    private String shortDescription;
    private String description;
    private List<String> attractions;
    private String bestTimeToVisit;
    private String estimatedBudget;
    private String recommendedDuration;
    private List<String> travelTips;
    private String imagePath;
    private boolean featured;

    public Destination() {
        this.attractions = new ArrayList<>();
        this.travelTips = new ArrayList<>();
    }

    public Destination(String id, String name, String city, String state, String category,
                       String shortDescription, String description, List<String> attractions,
                       String bestTimeToVisit, String estimatedBudget, String recommendedDuration,
                       List<String> travelTips, String imagePath, boolean featured) {
        this.id = id;
        this.name = name;
        this.city = city;
        this.state = state;
        this.category = category;
        this.shortDescription = shortDescription;
        this.description = description;
        this.attractions = (attractions != null) ? new ArrayList<>(attractions) : new ArrayList<>();
        this.bestTimeToVisit = bestTimeToVisit;
        this.estimatedBudget = estimatedBudget;
        this.recommendedDuration = recommendedDuration;
        this.travelTips = (travelTips != null) ? new ArrayList<>(travelTips) : new ArrayList<>();
        this.imagePath = imagePath;
        this.featured = featured;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getShortDescription() {
        return shortDescription;
    }

    public void setShortDescription(String shortDescription) {
        this.shortDescription = shortDescription;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<String> getAttractions() {
        return attractions != null ? attractions : Collections.emptyList();
    }

    public void setAttractions(List<String> attractions) {
        this.attractions = (attractions != null) ? new ArrayList<>(attractions) : new ArrayList<>();
    }

    public void addAttraction(String attraction) {
        if (attraction != null && !attraction.trim().isEmpty()) {
            if (this.attractions == null) {
                this.attractions = new ArrayList<>();
            }
            this.attractions.add(attraction.trim());
        }
    }

    public String getBestTimeToVisit() {
        return bestTimeToVisit;
    }

    public void setBestTimeToVisit(String bestTimeToVisit) {
        this.bestTimeToVisit = bestTimeToVisit;
    }

    public String getEstimatedBudget() {
        return estimatedBudget;
    }

    public void setEstimatedBudget(String estimatedBudget) {
        this.estimatedBudget = estimatedBudget;
    }

    public String getRecommendedDuration() {
        return recommendedDuration;
    }

    public void setRecommendedDuration(String recommendedDuration) {
        this.recommendedDuration = recommendedDuration;
    }

    public List<String> getTravelTips() {
        return travelTips != null ? travelTips : Collections.emptyList();
    }

    public void setTravelTips(List<String> travelTips) {
        this.travelTips = (travelTips != null) ? new ArrayList<>(travelTips) : new ArrayList<>();
    }

    public void addTravelTip(String tip) {
        if (tip != null && !tip.trim().isEmpty()) {
            if (this.travelTips == null) {
                this.travelTips = new ArrayList<>();
            }
            this.travelTips.add(tip.trim());
        }
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public boolean isFeatured() {
        return featured;
    }

    public void setFeatured(boolean featured) {
        this.featured = featured;
    }

    /**
     * Helper to get formatted location (e.g., "Agra, Uttar Pradesh").
     */
    public String getLocation() {
        if (city != null && !city.isEmpty() && state != null && !state.isEmpty()) {
            return city + ", " + state;
        } else if (city != null && !city.isEmpty()) {
            return city;
        } else if (state != null && !state.isEmpty()) {
            return state;
        }
        return "";
    }

    @Override
    public String toString() {
        return "Destination{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", city='" + city + '\'' +
                ", state='" + state + '\'' +
                ", category='" + category + '\'' +
                '}';
    }
}
