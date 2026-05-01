
@IsTest
private class MixPlaylistTest {

    @TestSetup
    static void makeData(){
        List<String> carols = new List<String>();
        List<String> lullabies = new List<String>();
        String pattern;
        Integer playlistLength;

    }

    @IsTest
    static void positiveTestAllLowerCase() {
        carols.add('Silent Night');
        carols.add('God Rest Ye Merry Gentlemen');
        carols.add('O Come Emmanuel');

        lullabies.add('You Are My Sunshine');
        lullabies.add('Brother John');
        lullabies.add('Winnie the Pooh');
        lullabies.add('Twinkle Twinkle');

        pattern = 'llcllc';
        playlistLength = 6;
        List<String> expected = new List<String>{'Silent Night', 'God Rest Ye Merry Gentlemen', 'You Are My Sunshine', 'O Come Emmanuel', 'Silent Night', 'Brother John'};

        Test.startTest();
        MixPlaylist mixPlaylist = new MixPlaylist();
        List<String> actual = mixPlaylist.mixPlaylist(carols, lullabies, pattern, playlistLength);
        Test.stopTest();

        Assert.areEqual(expected, actual, 'The playlist should have been ' + expected + ', instead was ' + actual);
        
    }

    @isTest
    static void positiveTestAllUpperCase() {

    }

    @isTest
    static void positiveTestUpperAndLowerCase() {

    }

    @isTest
    static void emptyCarolsOrLullabiesList() {

    }

    @isTest
    static void patternDoesNotHaveCOrL() {

    }

    @isTest
    static void patternHadAdditionalLetters() {

    }

    @isTest
    static void playlistLengthLessThanOne() {
        
    }
}