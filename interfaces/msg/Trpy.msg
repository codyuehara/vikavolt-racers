# Collective thrust + body rates command, on /quadx/trpy.
# Physical units, not normalized: Quad Sim consumes these directly, and on
# hardware the PX4 bridge node converts them to PX4's normalized setpoints.

std_msgs/Header header                  # stamp = time the command was computed
builtin_interfaces/Time state_stamp     # stamp of the EstState it was computed from (latency measurement)

float32 collective_thrust               # mass-normalized [m/s^2], along body +z
geometry_msgs/Vector3 body_rates        # roll, pitch, yaw rate [rad/s], body frame (FLU)
