package com.fivegearszerochill.paladins.presentation.adapters

import android.annotation.SuppressLint
import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.bumptech.glide.Glide
import com.fivegearszerochill.paladins.R
import com.fivegearszerochill.paladins.domain.models.player.LoadoutItemModel
import kotlinx.android.synthetic.main.loadout_item_item_view.view.*
import kotlinx.android.synthetic.main.loadout_item_view.view.*

class LoadoutItemAdapter(private val dataSource: List<LoadoutItemModel>? = ArrayList()): RecyclerView.Adapter<LoadoutItemViewHolder>() {

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): LoadoutItemViewHolder {
        val inflater = LayoutInflater.from(parent.context)
        return LoadoutItemViewHolder(inflater,parent)
    }

    override fun onBindViewHolder(holder: LoadoutItemViewHolder, position: Int) {
        holder.bind(dataSource?.get(position))
    }

    override fun getItemCount(): Int {
        return dataSource?.size ?: 0
    }
}

class LoadoutItemViewHolder(inflater: LayoutInflater, itemView: ViewGroup)
    : RecyclerView.ViewHolder( inflater.inflate(R.layout.loadout_item_item_view, itemView,false)) {

    @SuppressLint("SetTextI18n")
    fun bind(model: LoadoutItemModel?){
        if (model != null) {
            itemView.loadout_item_name.text = model.itemName
            itemView.loadout_item_description.text = model.description
            itemView.loadout_item_points.text = """${model.pointsAssignedToItem.toString()} Points"""
            Glide.with(itemView)
                .load(model.itemUrl)
                .into(itemView.loadout_item_image)
        }
    }
}