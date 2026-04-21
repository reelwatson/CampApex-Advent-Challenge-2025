public with sharing class DaysUntilBaby {
    public static Integer daysUntilBaby(String today, String dueDate) {
        // Your solution here
        //Check that dates are NOT null
        if (today == null || dueDate == null || String.isBlank(today) || String.isBlank(dueDate)) {
            throw new CustomExceptions.DaysUntilBabyException('Both dates must be valid, no null or blank dates');
        }        
        
        // TO DO: Fix variable declaration for todayDate and futureDueDate

        // Convert today String into numbers
        // Check that dates are valid - can accept dates in the past
        Date todayDate = Date.newInstance(1900, 11, 30);
        Date futureDueDate = Date.newInstance(1900, 10, 31);
        
        try {
            todayDate = Date.valueOf(today);
        }
        catch (Exception e) {
            throw new CustomExceptions.DaysUntilBabyException('Today must be a valid date in YYYY-MM-DD format. Currently the date is ' + today);
        }

        // Convert dueDate String into numbers 
        // Check that dates are valid - can accept dates in the past
        try {
            futureDueDate = Date.valueOf(dueDate);
        }
        catch (Exception e) {
            throw new CustomExceptions.DaysUntilBabyException('Due date must be a valid date in YYYY-MM-DD format. Currently the date is ' + dueDate);
        }
        
        // Use daysBetween() method from Date class and return
        return todayDate.daysBetween(futureDueDate);

        // Would be fun in the future to show a message to end user if dueDate is after today
        // Something like "Wow, baby still on their way!"
    }
}

// Given two dates as strings in the format 'YYYY-MM-DD'
// Presumption that neither date will be null or blank
// Presumption that both dates will be in the correct format