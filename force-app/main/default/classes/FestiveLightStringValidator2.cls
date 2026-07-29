/*Do not change the name of the class or the method signature.*/
class Solution {
    public Map<String, Object> validateLightString(String lights) {
        // Your solution here
        
        Map<String, Object> validatorMap = new Map<String, Object>();
        validatorMap.put('isValid', 'false');
        validatorMap.put('failurePoint', 0);
        
        if (String.isBlank(lights) || String.isEmpty(lights)) {
            return validatorMap;
        }

        // Turn the String param into a List<String>
        List<String> stringList = lights.split('');
        System.debug(stringList);
        
        // Use a fibonacci-type approach
        String previousColor;
        String currentColor = stringList[0];
        String nextColor = stringList[1];
        Integer index = 0;

        if (currentColor.equals(nextColor)) {
            //replace failurePoint 0 with -1
            return validatorMap;
        }
        

        /*
        Turn the String param into an array
        IF String = 2 characters AND characters do NOT match 
        THEN return true and -1
        ELSE return false and 1

        IF String = 4 characters
            oldOddCharacter = String[0]
            oldEvenCharacter = String [1]
            newOddCharacter = String[2]
            newEvenCharacter = String[3]
            IF odd characters match and even characters match AND odd and even characters DO NOT match
            THEN return true and -1
            ELSE 

        THEN loop through using traditional for loop (to track index); Start loop at String[2]
            IF index % 2 == 0
            THEN assign newOddCharacter to String[index]
            ELSE assign newEvenCharacter to String[index]
            IF

        IF String > 4 characters


        If the "old" character matches the "new" character
        */

        return validatorMap;
    }
}