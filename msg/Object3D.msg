# One detected object as an oriented 3D box, from its segmentation mask and the
# aligned depth image (any class, no class-specific model needed). The frame is
# the header frame of the enclosing Object3DArray (the depth optical frame).

# Stable Object_N id when TIPS re-identified the object, else "track_<track_id>".
string id

# Detector track id (hri_msgs/Entity.track_id).
uint32 track_id

string class_name

# Detection confidence (hri_msgs/Entity.bbox_xyxy.c), 0..1.
float32 score

# Box centre and orientation (the box axes). Default PCA fit: x = longest axis,
# z = shortest. Flat classes (cuboid face fit): z = face normal. Round classes
# (cylinder fit): z = disc axis. Only the visible surface is measured, so the
# size along the viewing direction is a lower bound.
geometry_msgs/Pose pose

# Full box size in metres along the pose x, y, z axes.
geometry_msgs/Vector3 size

# Valid depth points used for the fit.
uint32 point_count
