import 'package:flutter/cupertino.dart';

class AppColors {
  static const Color primaryBlue = Color(0xff016ffd);
  static const Color primaryCian = Color(0xff11c6b6);
  static const Color grey = Color(0xff9da9ac);

  static const LinearGradient electricViolet = LinearGradient(
    colors: [Color(0xFF667eea), Color(0xFF764ba2)], // deep purple to violet
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient sunsetPink = LinearGradient(
    colors: [Color(0xFFf093fb), Color(0xFFf5576c)], // bright pink to coral
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient oceanBlue = LinearGradient(
    colors: [Color(0xFF4facfe), Color(0xFF00f2fe)], // sky blue to cyan
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient neonOrange = LinearGradient(
    colors: [Color(0xFFfa709a), Color(0xFFfee140)], // hot pink to yellow
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient deepTeal = LinearGradient(
    colors: [Color(0xFF11998e), Color(0xFF38ef7d)], // teal to mint green
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient royalPurple = LinearGradient(
    colors: [Color(0xFF7F00FF), Color(0xFFE100FF)], // deep purple to magenta
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient fireRed = LinearGradient(
    colors: [Color(0xFFeb3349), Color(0xFFf45c43)], // crimson to coral red
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient coolBlue = LinearGradient(
    colors: [Color(0xFF2193b0), Color(0xFF6dd5ed)], // deep blue to light cyan
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
