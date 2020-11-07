package com.fivegearszerochill.paladins.presentation.fragments

import android.app.Activity.RESULT_OK
import android.content.Intent
import android.graphics.Bitmap
import android.graphics.ImageDecoder
import android.net.Uri
import android.os.Build
import android.os.Bundle
import android.os.Environment
import android.provider.MediaStore
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.Toast
import androidx.core.content.FileProvider
import com.fivegearszerochill.paladins.R
import com.google.android.gms.vision.Frame
import com.google.android.gms.vision.text.TextBlock
import com.google.android.gms.vision.text.TextRecognizer
import com.google.android.material.bottomsheet.BottomSheetDialogFragment
import com.theartofdev.edmodo.cropper.CropImage
import kotlinx.android.synthetic.main.fragment_modal_camera_bottom_sheet.*
import kotlinx.coroutines.*
import java.io.File
import java.lang.Exception


class CameraBottomSheetFragment : BottomSheetDialogFragment() {
    lateinit var mTextRecognizer: TextRecognizer
    lateinit var mImageView: ImageView

    companion object {
        fun newInstance(): CameraBottomSheetFragment? {
            return CameraBottomSheetFragment()
        }

        const val REQUEST_CAMERA_IMAGE = 111
    }

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        return inflater.inflate(R.layout.fragment_modal_camera_bottom_sheet, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        mImageView = captured_image as ImageView
        startTextRecognizer()
    }

    private fun startTextRecognizer() {
        mTextRecognizer = TextRecognizer.Builder(context).build()
        if (!this.mTextRecognizer.isOperational) {
            Toast.makeText(
                context,
                "Oops ! Not able to start the text recognizer ...",
                Toast.LENGTH_LONG
            ).show()
        } else {
            val chooserIntent = Intent(MediaStore.ACTION_IMAGE_CAPTURE)
            val file = File(Environment.getExternalStorageDirectory(), "MyPhoto.jpg")
            val uri = context?.let {
                FileProvider.getUriForFile(
                    it,
                    activity?.applicationContext?.packageName.toString() + ".provider",
                    file
                )
            }
            chooserIntent.putExtra(MediaStore.EXTRA_OUTPUT, uri)
            startActivityForResult(chooserIntent, REQUEST_CAMERA_IMAGE)
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (requestCode == REQUEST_CAMERA_IMAGE && resultCode == RESULT_OK) {
            val file = File(Environment.getExternalStorageDirectory(), "MyPhoto.jpg")
            val uri = context?.let {
                FileProvider.getUriForFile(
                    it,
                    activity?.applicationContext?.packageName.toString() + ".provider",
                    file
                )
            }
            activity?.let {
                CropImage.activity(uri)
                    .start(it, this)
            }
        }
        if (requestCode == CropImage.CROP_IMAGE_ACTIVITY_REQUEST_CODE) {
            val result = CropImage.getActivityResult(data)
            if (resultCode == RESULT_OK) {
                detectImageText(result.uri)
            } else if (resultCode == CropImage.CROP_IMAGE_ACTIVITY_RESULT_ERROR_CODE) {
                val error = result.error
                Toast.makeText(context, error.message, Toast.LENGTH_SHORT).show()
            }
        }
    }

    private fun loadBitmap(imageUri: Uri?): Bitmap? {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
            imageUri?.let {
                ImageDecoder.createSource(requireContext().contentResolver,
                    it
                )
            }?.let { ImageDecoder.decodeBitmap(it) }
        } else {
            MediaStore.Images.Media.getBitmap(requireContext().contentResolver, imageUri)
        }
    }

    private fun detectImageText(resultUri: Uri?){
        val scope = CoroutineScope(Dispatchers.IO)
        scope.launch {
            val imageBitmap = loadBitmap(resultUri)
            withContext(Dispatchers.Main){
                mImageView.setImageBitmap(imageBitmap)
                val imageFrame: Frame = Frame.Builder()
                    .setBitmap(imageBitmap)
                    .build()
                val textBlocks = mTextRecognizer.detect(imageFrame)
                for (i in 0 until textBlocks.size()) {
                    val textBlock: TextBlock = textBlocks.get(textBlocks.keyAt(i))
                    val text = textBlock.value
                    Toast.makeText(context, text, Toast.LENGTH_SHORT).show()
                }
            }
        }
    }
}