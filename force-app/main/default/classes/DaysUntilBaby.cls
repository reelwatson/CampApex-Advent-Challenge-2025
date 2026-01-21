public with sharing class DaysUntilBaby {
    public static Integer daysUntilBaby(String today, String dueDate) {
        // Your solution here
        // Convert today String into numbers
        Date todayDate = Date.valueOf(today);
        // Convert dueDate String into numbers 
        Date futureDueDate = Date.valueOf(dueDate);
        // Use daysBetween() method from Date class and return
        return todayDate.daysBetween(futureDueDate);
    }
}

// Given two dates as strings in the format 'YYYY-MM-DD'