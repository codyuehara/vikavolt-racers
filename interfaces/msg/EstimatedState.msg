#state + next gate info
# Estimated state of one quad, published by quadrace_ekf on /quadx/est_state.
# Observation layout follows Kaufmann et al., Nature 2023 (Swift):
# position, velocity, attitude, and the next gate's four corners.
# Feature construction (relative corners, rotation matrix, normalization)
# happens only in quadrace_policy.

uint16 SPEC_VERSION=2
uint16 spec_version

# stamp = time the estimate is valid for; frame_id = world (ENU)
std_msgs/Header header
string child_frame_id           # body frame, FLU

# ---- Vehicle state (policy inputs) ----
geometry_msgs/Point position            # world [m]
geometry_msgs/Vector3 linear_velocity   # world [m/s]
geometry_msgs/Quaternion orientation    # body in world, (x, y, z, w)

# ---- Next gate (policy input) ----
# From the (noisy) gate map on /track/gate_map, not ground truth.
string next_gate_id             # matches "id" in the Track JSON
uint16 next_gate_sequence_index # position in race.gate_sequence

# Inner-opening corners in the world frame (ENU) [m]. Fixed order, as seen
# looking through the gate along its traversal direction (gate +x):
#   [0] top-left  [1] top-right  [2] bottom-right  [3] bottom-left
# In gate-local coordinates (y left, z up):
#   TL = (0, +w/2, +h/2)  TR = (0, -w/2, +h/2)
#   BR = (0, -w/2, -h/2)  BL = (0, +w/2, -h/2)
geometry_msgs/Point[4] next_gate_corners

uint32 lap
bool race_complete              # next_gate_* undefined when true

# ---- Not used by the policy: safety, logging, error modeling ----
geometry_msgs/Vector3 angular_velocity  # body [rad/s], bias removed
float64[81] covariance          # 9x9 row-major: position, attitude (body rotation vector), velocity

uint8 STATUS_INITIALIZING=0
uint8 STATUS_OK=1
uint8 STATUS_DEGRADED=2
uint8 STATUS_LOST=3
uint8 status
float32 time_since_gate_detection
