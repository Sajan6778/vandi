import cv2
import datetime

# Initialize the camera (use 0 for default webcam)
cap = cv2.VideoCapture(0)

# Define the codec and create VideoWriter object
fourcc = cv2.VideoWriter_fourcc(*'XVID')
out = cv2.VideoWriter('output.mp4', fourcc, 20.0, (640,  480))

while cap.isOpened():
    ret, frame = cap.read()
    if ret:
        # Optional: Display the recording time on the video
        font = cv2.FONT_HERSHEY_SIMPLEX
        timestamp = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        cv2.putText(frame, timestamp, (10, 450), font, 0.5, (0, 255, 0), 1, cv2.LINE_AA)

        # Write the frame to the output file
        out.write(frame)

        # Display the resulting frame
        cv2.imshow('Recording', frame)

        # Quit recording if 'q' is pressed
        if cv2.waitKey(1) & 0xFF == ord('q'):
            break
    else:
        break

# Release everything when done
cap.release()
out.release()
cv2.destroyAllWindows()
