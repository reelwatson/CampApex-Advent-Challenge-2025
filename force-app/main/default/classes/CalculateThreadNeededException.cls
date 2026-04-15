public with sharing class CalculateThreadNeededException extends Exception {
    public CalculateThreadNeededException(String message) {
        super('Calculate Thread Needed Exception: '+ message);
    }
}