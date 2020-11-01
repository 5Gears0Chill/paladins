package com.fivegearszerochill.paladins.presentation.fragments

import android.app.Activity
import android.content.Intent
import android.graphics.Bitmap
import android.net.Uri
import android.os.Bundle
import android.provider.MediaStore
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.Toast
import com.fivegearszerochill.paladins.R
import com.google.android.gms.vision.Frame
import com.google.android.gms.vision.text.TextBlock
import com.google.android.gms.vision.text.TextRecognizer
import com.google.android.material.bottomsheet.BottomSheetDialogFragment
import kotlinx.android.synthetic.main.fragment_modal_camera_bottom_sheet.*


class CameraBottomSheetFragment : BottomSheetDialogFragment() {
    lateinit var mTextRecognizer: TextRecognizer
    lateinit var mImageView: ImageView
    private var imageToUploadUri: Uri? = null

    companion object {
        fun newInstance(): CameraBottomSheetFragment? {
            return CameraBottomSheetFragment()
        }

        const val CAMERA_PHOTO = 111
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
            startActivityForResult(chooserIntent, CAMERA_PHOTO)
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (requestCode == CAMERA_PHOTO && resultCode == Activity.RESULT_OK) {
            val imageBitmap = data?.extras?.get("data") as Bitmap
            if (imageToUploadUri == null) {
                val reducedSizeBitmap: Bitmap = imageBitmap
                mImageView.setImageBitmap(imageBitmap)
                val imageFrame: Frame = Frame.Builder()
                    .setBitmap(reducedSizeBitmap)
                    .build()
                val textBlocks = mTextRecognizer.detect(imageFrame)
                for (i in 0 until textBlocks.size()) {
                    val textBlock: TextBlock = textBlocks.get(textBlocks.keyAt(i))
                    val text = textBlock.value
                    Toast.makeText(context, text, Toast.LENGTH_SHORT).show()
                }
            } else {
                Toast.makeText(context, "Error while capturing Image", Toast.LENGTH_LONG).show()
            }
        }
    }
}