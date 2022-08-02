enum Sex { male, female }

enum Coeff { a, b, c, d, e, f }

enum Units { metric, imperial }

double inchToCm(double inches) => inches * 2.54;
double cmToInch(double cm) => cm / 2.54;

double lbsToKg(double lbs) => lbs / 2.20462262185;
double kgToLbs(double kg) => kg * 2.20462262185;

double mileToMeter(double mile) => mile * 1.609344 * 1000.0;
double mererToMile(double km) => km / 1.609344 / 1000.0;
