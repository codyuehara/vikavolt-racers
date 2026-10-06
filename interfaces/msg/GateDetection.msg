# GateDetection.msg: one gate seen in one image.
# The detector does not know which gate this is; the EKF does data association.

float32[8] corners_px           # u0,v0, u1,v1, u2,v2, u3,v3 in EstState corner order (TL, TR, BR, BL)
float32[4] corner_confidence    # 0..1 per corner
float32 confidence              # overall detection confidence

bool pose_valid                 # true if solvePnP succeeded
geometry_msgs/PoseWithCovariance pose   # gate center in the camera frame (from solvePnP)
