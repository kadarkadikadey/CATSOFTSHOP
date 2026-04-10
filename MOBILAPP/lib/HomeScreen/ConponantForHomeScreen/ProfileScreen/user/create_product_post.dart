import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CreateProductPost extends StatefulWidget {
  const CreateProductPost({super.key});

  @override
  State<CreateProductPost> createState() => _CreateProductPostState();
}

class _CreateProductPostState extends State<CreateProductPost> {
  // 1. List to hold the selected images
  final List<XFile> _selectedImages = [];
  final ImagePicker _picker = ImagePicker();

  // 2. Function to pick multiple images
  Future<void> _pickImages() async {
    // We use pickMultiImage to let user select several at once
    final List<XFile> images = await _picker.pickMultiImage();
    
    if (images.isNotEmpty) {
      setState(() {
        // We only take the first 4 images if they pick more
        if (_selectedImages.length + images.length <= 4) {
          _selectedImages.addAll(images);
        } else {
          // Show a message if they try to add too many
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("You can only upload up to 4 images")),
          );
          // Add only what fits
          int remainingSlots = 4 - _selectedImages.length;
          _selectedImages.addAll(images.take(remainingSlots));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List New Asset"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLabel("Product Images (${_selectedImages.length}/4)"),
            
            // 3. Dynamic Image Picker Section
            GestureDetector(
              onTap: _selectedImages.length < 4 ? _pickImages : null,
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: _selectedImages.isEmpty 
                  ? _buildPlaceholder() 
                  : _buildImageGrid(),
              ),
            ),
            
            const SizedBox(height: 30),

            // ... Your Existing Input Fields ...
            _buildLabel("Asset Title"),
            _buildTextField("e.g. Modern Dashboard UI"),
            const SizedBox(height: 20),
            
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel("Price (\$)"),
                      _buildTextField("0.00", keyboard: TextInputType.number),
                    ],
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel("Category"),
                      _buildTextField("UI Kit"),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildLabel("Description"),
            _buildTextField("Describe your digital asset...", maxLines: 4),
            const SizedBox(height: 40),

            // Submit Button
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Asset posted successfully!")),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0F172A),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("Confirm & Post", 
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 4. Widget to show when no images are picked
  Widget _buildPlaceholder() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.add_photo_alternate_outlined, size: 50, color: Colors.grey[400]),
        const SizedBox(height: 10),
        Text("Click to upload preview images", style: TextStyle(color: Colors.grey[600])),
      ],
    );
  }

  // 5. Widget to show picked images in a grid
  Widget _buildImageGrid() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: _selectedImages.length + (_selectedImages.length < 4 ? 1 : 0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 1.5,
        ),
        itemBuilder: (context, index) {
          if (index == _selectedImages.length) {
            return GestureDetector(
              onTap: _pickImages,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: const Icon(Icons.add_a_photo_outlined, color: Colors.blueGrey),
              ),
            );
          }
          return Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(
                  File(_selectedImages[index].path),
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedImages.removeAt(index);
                    });
                  },
                  child: const CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.red,
                    child: Icon(Icons.close, size: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
    );
  }

  Widget _buildTextField(String hint, {int maxLines = 1, TextInputType keyboard = TextInputType.text}) {
    return TextField(
      maxLines: maxLines,
      keyboardType: keyboard,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
      ),
    );
  }
}