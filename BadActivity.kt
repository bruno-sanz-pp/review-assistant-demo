class BadActivity : AppCompatActivity() {

    private var textView: TextView? = null
    private var btnClick: Button? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        textView = findViewById(R.id.text_view_message)
        btnClick = findViewById(R.id.btn_click)

        btnClick?.setOnClickListener(object : View.OnClickListener {
            override fun onClick(view: View) {
                val message = getMessage()
                textView?.text = message
            }
        })
    }

    private fun getMessage(): String {
        val message = "Hello, "
        message.concat(getName())
        return message
    }

    private fun getName(): String {
        val editTextName = findViewById<EditText>(R.id.edit_text_name)
        return editTextName.text.toString()
    }
}