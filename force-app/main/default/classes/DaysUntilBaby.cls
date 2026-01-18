public with sharing class DaysUntilBaby {
    public Integer daysUntilBaby(String today, String dueDate) {
        // Your solution here
        // Convert today String into numbers
        date todayDate = Date.valueOf(today);
        // Convert dueDate String into numbers 
        date futureDueDate = Date.valueOf(dueDate);
        // Use daysBetween() method from Date class and return
        return todayDate.daysBetween(futureDueDate);
    }
}