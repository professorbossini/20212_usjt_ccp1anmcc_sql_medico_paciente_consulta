const express = require ('express')
const app = express()
const mysql = require('mysql2')
//registramos um middleware
app.use(express.json())


const porta = process.env.PORT || 3000

app.listen (porta, () => console.log (`Em execução. Porta: ${porta}.`))

app.get('/medicos', (req, res) => {
    const connection  = mysql.createConnection({
        host: 'localhost',
        user: 'rodrigo',
        password: '1234',
        database: '20212_usjt_ccp1anmcc_hospital'
    })
    const sql = 'SELECT * FROM tb_medico'
    connection.query(
        sql,
        (err, results, fields) => {
            console.log(results)
            console.log(fields)
            res.send('ok')
        }
    )
})