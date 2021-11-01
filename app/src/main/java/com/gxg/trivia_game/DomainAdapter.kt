package com.gxg.trivia_game

import android.app.AlertDialog
import android.graphics.Color
import android.view.Gravity
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.PopupWindow
import androidx.recyclerview.widget.RecyclerView
import com.gxg.trivia_game.domain.Domain
import kotlinx.android.synthetic.main.item_atlas.view.*
import android.graphics.drawable.ColorDrawable
import android.widget.EditText

class DomainAdapter(
    private val domains: MutableList<Domain>
) : RecyclerView.Adapter<DomainAdapter.DomainViewHolder>() {

    inner class DomainViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
        private var btDelete: Button = itemView.findViewById(R.id.btRemove)
        private var btEdit: Button = itemView.findViewById(R.id.btEdit)

        init {
            onDeleteButtonClick(itemView)
            onEditButtonClicked(itemView)
        }

        private fun onDeleteButtonClick(itemView: View) {
            btDelete.setOnClickListener {
                val position: Int = adapterPosition
                val dialog = PopupWindow(itemView.context)
                val view =
                    LayoutInflater.from(itemView.context).inflate(R.layout.delete_dialog, null)
                dialog.contentView = view
                dialog.setBackgroundDrawable(ColorDrawable(Color.WHITE))
                dialog.showAtLocation(itemView, Gravity.CENTER, 0, 0)
                val yes: Button = view.findViewById(R.id.btYes)
                val no: Button = view.findViewById(R.id.btNo)

                yes.setOnClickListener {
                    dialog.dismiss()
                    deleteSelectedDomain(position)
                }
                no.setOnClickListener {
                    dialog.dismiss()
                }
            }
        }

        private fun onEditButtonClicked(itemView: View) {
            btEdit.setOnClickListener {
                val position: Int = adapterPosition

                val view =
                    LayoutInflater.from(itemView.context).inflate(R.layout.update_layout, null)

                val dialog = PopupWindow(
                    view,
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.MATCH_PARENT
                )

                dialog.contentView = view
                dialog.isFocusable = true
                dialog.setBackgroundDrawable(ColorDrawable(Color.WHITE))
                dialog.showAtLocation(itemView, 1, 0, 0)

                val save: Button = view.findViewById(R.id.btSave)
                val back: Button = view.findViewById(R.id.btBack)

                val selected: Domain = domains[position]
                val etDomainName: EditText = view.findViewById(R.id.etDomainNEdit)
                val etDomainText: EditText = view.findViewById(R.id.etDomainTEdit)

                etDomainName.setText(selected.name)
                etDomainText.setText(selected.text)

                save.setOnClickListener {
                    selected.name = etDomainName.text.toString()
                    selected.text = etDomainText.text.toString()
                    notifyDataSetChanged()
                    dialog.dismiss()
                }
                back.setOnClickListener {
                    dialog.dismiss()
                }
            }
        }
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): DomainViewHolder {
        return DomainViewHolder(
            LayoutInflater.from(parent.context).inflate(
                R.layout.item_atlas,
                parent,
                false
            )
        )
    }

    fun addDomain(domain: Domain) {
        domains.add(domain)
        notifyItemInserted(domains.size - 1)
    }

    fun deleteSelectedDomain(id: Int) {
        domains.removeAt(id)
        notifyDataSetChanged()
    }

    override fun onBindViewHolder(holder: DomainViewHolder, position: Int) {
        val currentDomain = domains[position]
        holder.itemView.apply {
            tvDomainName.text = currentDomain.name
            tvText.text = currentDomain.text
            tag = currentDomain.id
        }
    }

    override fun getItemCount(): Int {
        return domains.size
    }
}