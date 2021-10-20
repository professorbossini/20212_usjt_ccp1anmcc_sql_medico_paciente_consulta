require('dotenv').config()
// const dotenv = require('dotenv')
// dotenv.config()
const express = require ('express')
const app = express()
const mysql = require('mysql2')
//registramos um middleware
app.use(express.json())


const { DB_USER, DB_PASSWORD, DB_HOST, DB_DATABASE, PORT} = process.env
const porta = PORT || 3000


app.listen (porta, () => console.log (`Em execução. Porta: ${porta}.`))

app.get('/medicos', (req, res) => {
    const connection  = mysql.createConnection({
        host: DB_HOST,
        user: DB_USER,
        password: DB_PASSWORD,
        database: DB_DATABASE
    })
    const sql = 'SELECT * FROM tb_medico'
    connection.execute(
        sql,
        (err, results, fields) => {
            res.json(results)
        }
    )
})

app.post('/medicos', (req, res) => {
    const connection = mysql.createConnection({
        host: DB_HOST,
        user: DB_USER,
        password: DB_PASSWORD,
        database: DB_DATABASE
    })
    // const crm = req.body.crm
    // const nome = req.body.nome
    const { crm, nome } = req.body
    // const sql = "INSERT INTO tb_medico (crm, nome) VALUES (" + crm + ", '" + nome + "')"
    const sql = "INSERT INTO tb_medico (crm, nome) VALUES (?, ?)"
    connection.execute(
        sql,
        [crm, nome],
        (err, results, fields) => {
            console.log(results)
            res.send('ok')            
        }
    )
})

app.get('/pacientes', (req, res) => {
    const connection = mysql.createConnection({
        host: DB_HOST,
        user: DB_USER,
        password: DB_PASSWORD,
        database: DB_DATABASE
    })
    const sql = 'SELECT * FROM tb_paciente'
    connection.execute(
        sql,
        (err, results, fields) => {
            res.json(results)
        }
    )
})