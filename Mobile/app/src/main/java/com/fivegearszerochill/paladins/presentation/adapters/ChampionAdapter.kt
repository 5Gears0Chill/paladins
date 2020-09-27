package com.fivegearszerochill.paladins.presentation.adapters

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.paging.PagingDataAdapter
import androidx.recyclerview.widget.DiffUtil
import androidx.recyclerview.widget.RecyclerView
import com.bumptech.glide.Glide
import com.fivegearszerochill.paladins.R
import com.fivegearszerochill.paladins.domain.models.initial.ChampionModel
import kotlinx.android.synthetic.main.champion_item_view.view.*

class ChampionAdapter(diffCallback: DiffUtil.ItemCallback<ChampionModel>) :
    PagingDataAdapter<ChampionModel, ChampionViewHolder>(diffCallback) {

    override fun onBindViewHolder(holder: ChampionViewHolder, position: Int) {
        val item = getItem(position)
        holder.bind(item)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ChampionViewHolder {
        val inflater = LayoutInflater.from(parent.context)
        return ChampionViewHolder(inflater,parent)
    }

    object ChampionModelComparator: DiffUtil.ItemCallback<ChampionModel>(){
        override fun areItemsTheSame(oldItem: ChampionModel, newItem: ChampionModel): Boolean {
            return oldItem.id == newItem.id
        }

        override fun areContentsTheSame(oldItem: ChampionModel, newItem: ChampionModel): Boolean {
            return oldItem == newItem
        }
    }
}

class ChampionViewHolder(inflater: LayoutInflater, itemView: ViewGroup)
    : RecyclerView.ViewHolder( inflater.inflate(R.layout.champion_item_view, itemView,false)) {

    fun bind(model: ChampionModel?){
        itemView.lore.text = model?.lore
        itemView.title.text = model?.name
        itemView.description.text = model?.title

        Glide.with(itemView)
            .load(model?.championIconURL)
            .into(itemView.champion_image)
    }
}
