public with sharing class MixPlaylist {
    public List<String> mixPlaylist(List<String> carols, List<String> lullabies, String pattern, Integer playlistLength) {
        // Your solution here

        List<String> playList = new List<String>();

        if (carols == null || carols.isEmpty() || lullabies == null || lullabies.isEmpty()) {
            System.debug('Exited early because one or both lists were null or empty.');
            System.debug('Carols: ' + carols);
            System.debug('Lullabies: ' + lullabies);
            return playList;
        }

        pattern = pattern.toLowerCase();
        System.debug(pattern);

        Integer carolIndex = 0;
        Integer lullabyIndex = 0;

        for (Integer i = 0; i < playlistLength; i++) {
        // This will return the character in the pattern string
            String letter = pattern.substring(
                Math.mod(i, pattern.length()), 
                Math.mod(i, pattern.length()) + 1
            );

        System.debug('For index ' + i + ', current letter is ' + letter);

            if (!letter.equals('c') && !letter.equals('l')) {
                System.debug('Letter did not equal c or l.');
                return new List<String>();
            }
            /*
            Tricky part: songs cycle within their list,
            aka index wraps around when end is reached
            And pattern repeats cyclically until playlistLength is reached
            */
            else if (letter.equals('c')) {
                // Use modulo to loop through carols and add to playList
                playList.add(carols[Math.mod(carolIndex, carols.size())]);
                carolIndex++;
            }
            else if (letter.equals('l')) {
                // Use modulo to loop through lullabies and add to playList
                playList.add(lullabies[Math.mod(lullabyIndex, lullabies.size())]);
                lullabyIndex++;
            }
        }
        System.debug(playList);
        return playList;

    }
}