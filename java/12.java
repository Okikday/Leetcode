import java.util.LinkedHashMap;
import java.util.Map;

class Solution {
    private static final Map<Integer, String> romanSymbols = new LinkedHashMap<>();

    static {
        romanSymbols.put(1, "I");
        romanSymbols.put(5, "V");
        romanSymbols.put(10, "X");
        romanSymbols.put(50, "L");
        romanSymbols.put(100, "C");
        romanSymbols.put(500, "D");
        romanSymbols.put(1000, "M");
    }

    String intToRoman(int digit) {
        if (digit < 0)
            return "";

        int[] dupKeys = romanSymbols.keySet().stream().mapToInt(Integer::intValue).toArray();
        int posIndex;
        String str = "";
        posIndex = romanSymbols.size() - 1;

        while (posIndex >= 0) {
            ResolveResult resolve4or9Result = resolveStartsWith(digit, dupKeys, new int[] { 9, 4 });
            if (resolve4or9Result != null) {
                str += resolve4or9Result.roman;
                digit = resolve4or9Result.rem;
                posIndex--;
                continue;
            }
            final int factor = dupKeys[posIndex];
            final int times = digit / factor;
            if (times == 0) {
                posIndex--;
                continue;
            }
            final int rem = digit % factor;
            str += romanSymbols.get(factor).repeat(times);
            posIndex--;
            digit = rem;
        }
        return str;
    }

    int digitLength(int digit) {
        return digit == 0 ? 1 : (int) (Math.log(Math.abs(digit)) / Math.log(10)) + 1;
    }

    int firstDigit(int digit, int times) {
        return digit / times;
    }

    ResolveResult resolveStartsWith(int digit, int[] keys, int[] digitsToCheck) {
        int factor = (int) Math.pow(10, digitLength(digit) - 1);
        final int firstDigit = this.firstDigit(digit, factor);

        for (final int check : digitsToCheck) {
            if (firstDigit == check) {
                final int roundDigit = firstDigit * factor;
                return new ResolveResult(
                        romanSymbols.getOrDefault(factor, "") + romanSymbols.getOrDefault(factor + roundDigit, ""),
                        digit - roundDigit);
            }
        }
        return null;
    }

    static class ResolveResult {
        final String roman;
        final int rem;

        ResolveResult(String roman, int rem) {
            this.roman = roman;
            this.rem = rem;
        }
    }

    public static void main(String[] args) {
        System.out.println("resolved: " + new Solution().intToRoman(1994));
    }
}
