import cv2

# BGR coler
RED     = (0, 0, 255)
BLUE    = (255, 0, 0)
GREEN   = (0, 255, 0)
WHITE   = (255, 255, 255)
KELIN   = (167, 47, 0)
BLACK   = (0, 0, 0)
SLIVER  = (192, 192, 192)

# Text style
FONT        = cv2.FONT_HERSHEY_COMPLEX
FONT_SCALE  = 2.0
LINE        = cv2.LINE_AA

# Optional
ALPHA       = 0.4

def Remind(img, txt1, txt2=None, txt3=None):
    if txt1 and txt2 and txt3:
        cv2.putText(img, txt1, (10, 60), FONT, FONT_SCALE, BLACK, 3, LINE)
        cv2.putText(img, txt1, (10, 60), FONT, FONT_SCALE, WHITE, 2, LINE)

        cv2.putText(img, txt2, (10, 120), FONT, FONT_SCALE, BLACK, 3, LINE)
        cv2.putText(img, txt2, (10, 120), FONT, FONT_SCALE, WHITE, 2, LINE)

        cv2.putText(img, txt3, (10, 180), FONT, FONT_SCALE, BLACK, 3, LINE)
        cv2.putText(img, txt3, (10, 180), FONT, FONT_SCALE, WHITE, 2, LINE)
    elif tx1 and txt2:
        cv2.putText(img, txt1, (10, 40), FONT, FONT_SCALE, RED, 2, LINE)
        cv2.putText(img, txt2, (10, 100), FONT, FONT_SCALE, RED, 2, LINE)
    else:
        cv2.putText(img, txt1, (10, 40), FONT, FONT_SCALE, RED, 2, LINE)