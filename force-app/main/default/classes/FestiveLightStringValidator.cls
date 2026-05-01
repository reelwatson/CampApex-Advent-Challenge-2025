public class FestiveLightStringValidator {
    public Map<String, Object> FestiveLightStringValidator(String lights) {
        Map<String, Object> validatorMap = new Map<String, Object>();

        if (String.isBlank(lights || String.isEmpty(lights))) {
            System.debug('The string is empty so nothing is returned.');
            return validatorMap;
        }

        String currentLetter = lights.substring(0,2);
        String nextLetter = lights.substring(1,2);

        while(nextLetter != null) {
            if (currentLetter.equals(nextLetter)) {
                validatorMap.put('isValid', 'false');
                validatorMap.put('failurePoint', lights.indexOf(currentLetter));
            }
        }
        
        // Check that lights is not an empty string
        // Check sequence for alternation, aka does previous character match current character/current character match next character
        // End loop when next character is null (while (nextCharacter != null))
        
        return validatorMap;
    }
}