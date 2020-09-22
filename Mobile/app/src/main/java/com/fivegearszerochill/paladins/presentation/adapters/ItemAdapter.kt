package com.fivegearszerochill.paladins.presentation.adapters

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.paging.PagingDataAdapter
import androidx.recyclerview.widget.DiffUtil
import androidx.recyclerview.widget.RecyclerView
import com.bumptech.glide.Glide
import com.fivegearszerochill.paladins.R
import com.fivegearszerochill.paladins.domain.models.initial.ItemModel
import kotlinx.android.synthetic.main.champion_item_view.view.*

class ItemAdapter(diffCallback: DiffUtil.ItemCallback<ItemModel>) :
    PagingDataAdapter<ItemModel, ItemViewHolder>(diffCallback) {

    override fun onBindViewHolder(holder: ItemViewHolder, position: Int) {
        val item = getItem(position)
        // Note that item may be null. ViewHolder must support binding a
        // null item as a placeholder.
        holder.bind(item)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ItemViewHolder {
        val inflater = LayoutInflater.from(parent.context)
        return ItemViewHolder(inflater,parent)
    }

    object ItemModelComparator: DiffUtil.ItemCallback<ItemModel>(){
        override fun areItemsTheSame(oldItem: ItemModel, newItem: ItemModel): Boolean {
            // Id is unique.
            return oldItem.id == newItem.id
        }

        override fun areContentsTheSame(oldItem: ItemModel, newItem: ItemModel): Boolean {
            return oldItem == newItem
        }
    }
}

class ItemViewHolder(inflater: LayoutInflater, itemView: ViewGroup)
    : RecyclerView.ViewHolder( inflater.inflate(R.layout.champion_item_view, itemView,false)) {

    fun bind(model: ItemModel?){
        itemView.lore.text = model?.description
        itemView.title.text = model?.deviceName
        itemView.description.text = model?.price.toString()

        Glide.with(itemView)
            .load(model?.itemIconURL)
            .centerCrop()
            .into(itemView.champion_image)
    }
}