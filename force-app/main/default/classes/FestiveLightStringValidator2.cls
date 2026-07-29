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
        
        if (stringList.size() == 1) {
            return validatorMap;
        }
        
        // Use a fibonacci-type approach
        String previousColor;
        String currentColor = stringList[0];
        System.debug('First color is ' + currentColor);
        String nextColor = stringList[1];
        System.debug('Second color is ' + nextColor);
        Integer index = 0;


        // Put the below inside a loop (which loop?)
        if (currentColor.equals(nextColor)) {
            //replace failurePoint 0 with 1
            validatorMap.put('failurePoint', 1);
            return validatorMap;
        }

        previousColor = currentColor;
        currentColor = nextColor;
        index++;
        System.debug('previousColor is now ' + previousColor);
        System.debug('currentColor is now ' + currentColor);
        System.debug('index is now ' + index);

        if (stringList.size() > 2) {
            nextColor = stringList[index + 1];
            System.debug('nextColor is now ' + nextColor + ' at index ' + (index + 1));
            
            // TO DO: Have the loop stop when nextColor is blank; maybe a WHILE loop?
            for (Integer i = index; i < stringList.size(); i++) {
                // Check that previousColor equals nextColor and currentColor does not equal nextColor
                // If yes then previousColor becomes currentColor, currentColor becomes nextColor, index++, and nextColor is stringList[index]
                
                if (currentColor.equals(nextColor) || !previousColor.equals(nextColor)) {
                    //replace failurePoint 0 with current index
                    validatorMap.put('failurePoint', index);
                    return validatorMap;
                }

                else {
                    previousColor = currentColor;
                    currentColor = nextColor;
                    index++;
                    nextColor = stringList[index];
                }

            }

        }

        return validatorMap;
    }
}