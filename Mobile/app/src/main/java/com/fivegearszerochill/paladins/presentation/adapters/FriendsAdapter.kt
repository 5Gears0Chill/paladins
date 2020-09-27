package com.fivegearszerochill.paladins.presentation.adapters

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.paging.PagingDataAdapter
import androidx.recyclerview.widget.DiffUtil
import androidx.recyclerview.widget.RecyclerView
import com.fivegearszerochill.paladins.R
import com.fivegearszerochill.paladins.domain.models.player.FriendModel
import com.fivegearszerochill.paladins.domain.util.empty
import kotlinx.android.synthetic.main.friend_item_view.view.*

class FriendsAdapter(diffCallback: DiffUtil.ItemCallback<FriendModel>)
    :PagingDataAdapter<FriendModel, FriendViewHolder>(diffCallback){

    override fun onBindViewHolder(holder: FriendViewHolder, position: Int) {
        val item = getItem(position)
        holder.bind(item)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): FriendViewHolder {
        val inflater = LayoutInflater.from(parent.context)
        return FriendViewHolder(inflater,parent)
    }

    object FriendModelComparator: DiffUtil.ItemCallback<FriendModel>(){
        override fun areItemsTheSame(oldItem: FriendModel, newItem: FriendModel): Boolean {
            return oldItem.id == newItem.id
        }

        override fun areContentsTheSame(oldItem: FriendModel, newItem: FriendModel): Boolean {
            return oldItem == newItem
        }
    }
}

class FriendViewHolder(inflater: LayoutInflater, itemView: ViewGroup)
    : RecyclerView.ViewHolder( inflater.inflate(R.layout.friend_item_view, itemView,false)) {

    fun bind(model: FriendModel?){
        itemView.name.text = model?.name ?: String.empty()
    }
}