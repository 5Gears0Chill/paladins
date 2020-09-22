package com.fivegearszerochill.paladins.presentation.adapters

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.fivegearszerochill.paladins.R
import com.fivegearszerochill.paladins.domain.models.player.FriendModel
import com.fivegearszerochill.paladins.domain.util.empty
import kotlinx.android.synthetic.main.friend_item_view.view.*

class FriendsAdapter: RecyclerView.Adapter<FriendViewHolder>() {

    private val dataSource = ArrayList<FriendModel>()

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): FriendViewHolder {
        val inflater = LayoutInflater.from(parent.context)

        return FriendViewHolder(inflater,parent)
    }

    override fun onBindViewHolder(holder: FriendViewHolder, position: Int) {
        holder.bind(dataSource[position])
    }

    override fun getItemCount(): Int {
        return dataSource.size
    }

    fun addAll(friends: List<FriendModel>){
        for (f in friends){
            add(f)
        }
    }

    private fun add(friend: FriendModel){
        dataSource.add(friend)
    }
}

class FriendViewHolder(inflater: LayoutInflater, itemView: ViewGroup)
    : RecyclerView.ViewHolder( inflater.inflate(R.layout.friend_item_view, itemView,false)) {

    fun bind(model: FriendModel?){
        itemView.name.text = model?.name ?: String.empty()
    }
}