/*Do not change the name of the class or the method signature.*/
class Solution {
    public Map<String, Object> validateLightString(String lights) {
        // Your solution here
        
        Map<String, Object> validatorMap = new Map<String, Object>();
        validatorMap.put('isValid', 'true');
        validatorMap.put('failurePoint', -1);

        // Turn the String param into a List<String>
        System.debug(stringList);
        List<String> stringList = lights.split('');

        
        if (String.isBlank(lights) || String.isEmpty(lights) || stringList.size() < 2) {
            validatorMap.put('isValid', 'false');
            validatorMap.put('failurePoint', 0);
            return validatorMap;
        }
        
        // Use a fibonacci-type approach
        else {

            Integer index = 1;
            String previousColor;
            String currentColor = stringList[0];
            String nextColor = stringList[1];
            System.debug('currentColor is ' + currentColor);
            System.debug('nextColor is ' + nextColor);
            System.debug('Index is ' + index);

            if (currentColor.equals(nextColor) || stringList.size() == 2) {
                //replace failurePoint with 1 
                // TO DO: Double check which color variable should be the failurePoint
                validatorMap.put('isValid', 'false');
                validatorMap.put('failurePoint', 1);
                return validatorMap;
            }

            else if (stringList.size() > 2) {
                
                for (index = 1; index < stringList.size(); index++) {
                    System.debug('Running through loop ' + index);

                    nextColor = stringList[index + 1];
                    System.debug('nextColor is now ' + nextColor + ' at index ' + (index + 1));
                    System.debug('Comparing previousColor' + previousColor + ' against with currentColor ' + currentColor + ' and nextColor ' + nextColor);

                    // Check that previousColor equals nextColor and currentColor does not equal nextColor
                    // If yes then previousColor becomes currentColor, currentColor becomes nextColor, index++, and nextColor is stringList[index]
                    
                    if (currentColor.equals(nextColor) || !previousColor.equals(nextColor)) {
                        //replace failurePoint with current index
                        validatorMap.put('isValid', 'false');
                        validatorMap.put('failurePoint', index);
                        return validatorMap;
                    }
                    
                    else {
                        previousColor = currentColor;
                        currentColor = nextColor;
                
                        System.debug('previousColor is now ' + previousColor);
                        System.debug('currentColor is now ' + currentColor);
                        System.debug('currentColor is now at index ' + index);
                        System.debug('End of loop ' + index);
                    }
                }
            }
        }
        return validatorMap;
    }
}