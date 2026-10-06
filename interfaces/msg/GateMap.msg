# Full track as the autonomy stack believes it, on /track/gate_map
# (transient-local durability, published once).

std_msgs/Header header          # frame_id = world (ENU)

string[] gate_ids               # one entry per gate
geometry_msgs/Point[] corners   # 4 per gate, same order as gate_ids, EstState corner order
string[] gate_sequence          # race.gate_sequence from the Track JSON (ids, repeats allowed)
uint32 laps
