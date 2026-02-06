* Encoding: UTF-8.
*MISSING VALUE SETUP FOR DIGITAL LIFE & MENTAL HEALTH VARIABLES.
MISSING VALUES
  intrnetuse intlnly intskill happy diagnosd mhtreatd
  (-100 THRU -70).
EXECUTE.



*RECODE DIGITAL VARIABLES SO HIGHER = MORE DIGITAL ENGAGEMENT.

RECODE intrnetuse
  (1=7) (2=6) (3=5) (4=4) (5=3) (6=2) (7=1)
  INTO intrnetuse_r.

RECODE intlnly
  (1=5) (2=4) (3=3) (4=2) (5=1)
  INTO intlnly_r.

RECODE intskill
  (1=5) (2=4) (3=3) (4=2) (5=1)
  INTO intskill_r.

VARIABLE LABELS
 intrnetuse_r "Frequency of internet use (reversed: higher = more use)"
 intlnly_r "Would feel lonely without internet (reversed: higher = more lonely)"
 intskill_r "Internet skill (reversed: higher = more skilled)".

EXECUTE.


*DIGITAL ENGAGEMENT INDEX.
COMPUTE dig_engage = MEAN(intrnetuse_r, intskill_r, intlnly_r).
VARIABLE LABELS dig_engage "Digital Engagement Index (use + skill + emotional reliance)".
EXECUTE.
