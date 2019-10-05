///@description Destroy room structures
//Destroy shadow text buffers
shadow_text_cleanup();
//Destroy depth grid
depth_cleanup();
//Destroy camera
camera_destroy(camera);