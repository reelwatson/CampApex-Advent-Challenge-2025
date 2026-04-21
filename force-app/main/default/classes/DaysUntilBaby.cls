public with sharing class DaysUntilBaby {
    public static Integer daysUntilBaby(String today, String dueDate) {
        // Your solution here
        // REGEX check to confirm both strings are in format YYYY-MM-DD; if not throw Exception
        // Convert today String into numbers
        // Check that dates are valid - can accept dates in the past
        Date todayDate = Date.valueOf(today);
        // Convert dueDate String into numbers 
        Date futureDueDate = Date.valueOf(dueDate);
        // Use daysBetween() method from Date class and return
        return todayDate.daysBetween(futureDueDate);
    }
}

// Given two dates as strings in the format 'YYYY-MM-DD'
// Presumption that neither date will be null or blank
// Presumption that both dates will be in the correct format