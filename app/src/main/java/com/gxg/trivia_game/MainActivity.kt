package com.gxg.trivia_game

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.recyclerview.widget.LinearLayoutManager
import com.gxg.trivia_game.domain.Domain
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {

    private lateinit var domainAdapter: DomainAdapter

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val domainList: MutableList<Domain> = mutableListOf<Domain>()

        val domainMedicina = Domain(1, "Medicina", "Informatii generale")
        val domainInformatica = Domain(2, "Informatica", "Informatii generale")

        domainList.add(domainMedicina)
        domainList.add(domainInformatica)

        domainAdapter = DomainAdapter(domainList)
        rvAtlasItems.adapter = domainAdapter
        rvAtlasItems.layoutManager = LinearLayoutManager(this)

        btnAddDomain.setOnClickListener {
            val domainName = etDomainName.text.toString()
            val domainText = etDomainText.text.toString()
            if (domainText.isNotEmpty() && domainName.isNotEmpty()) {
                val domain = Domain(domainAdapter.itemCount, domainName, domainText)
                domainAdapter.addDomain(domain)
                etDomainText.text.clear()
                etDomainName.text.clear()
            }
        }
    }
}