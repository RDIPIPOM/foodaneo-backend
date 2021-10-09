import { connect } from '../database'

export const signup = async (req, res) => {
    const connection = await connect();
    const error = _validateparamssignup(req.body)
    if (error.length === 0) {
        console.log(_is_email_unique(connection, req.body.email))
        if (await _is_email_unique(connection, req.body.email)) {
            const defaultCreditLimit = 1000;
            const query = "INSERT INTO user(first_name, last_name, email, phone, password, credit_limit) VALUES (?, ?, ?, ?, ?, 1000);"
            const [result] = await connection.query(query, [req.body.first_name, req.body.last_name, req.body.email, req.body.phone, req.body.password, defaultCreditLimit]).catch(function (err) {
                console.log("Promise Rejected" + err);
            });
            res.json({
                id: result["insertId"]
            })
        } else {
            res.send([{
                error_code: "signuperror6",
                error: "Email already exists"
            }])
        }
    } else
        res.send(error)
}

export const signin = async (req, res) => {
    const connection = await connect()
    const query = 'SELECT * FROM user WHERE email = ? AND password = ?;';
    const [result] = await connection.query(query, [req.body.email, req.body.password]).catch(function (err) {
        console.log("Promise Rejected" + err);
    });
    if (result.length > 0)
        res.json(result[0]["id"])
    else {
        res.json({
            error_code: "signinerror1",
            error: "User or password incorrect"
        })
    }
}

function _validateparamssignup(params) {
    let errorlog = []
    const regexName = /^[a-zA-ZÑñÁáÉéÍíÓóÚúÜü\s]+$/
    const regexEmail = /^\w+@(\w+\.)+\w{2,4}$/
    const regexPhone = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/
    const regexPassword = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,20}$/

    if (!regexName.exec(params.first_name)) {
        errorlog.push({
            error_code: "signuperror1",
            error: "Invalid first name"
        })
    }
    if (!regexName.exec(params.last_name)) {
        errorlog.push({
            error_code: "signuperror2",
            error: "Invalid last name"
        })
    }
    if (!regexEmail.exec(params.email)) {
        errorlog.push({
            error_code: "signuperror3",
            error: "Invalid email"
        })
    }
    if (!regexPhone.exec(params.phone)) {
        errorlog.push({
            error_code: "signuperror4",
            error: "Invalid phone"
        })
    }
    if (!regexPassword.exec(params.password)) {
        errorlog.push({
            error_code: "signuperror5",
            error: "Invalid password"
        })
    }

    return errorlog
}

const _is_email_unique = async (connection, email) => {
    let query = "SELECT COUNT(*) FROM user WHERE email = ?;"
    const [existing_emails] = await connection.query(query, [email])
    console.log(existing_emails[0]['COUNT(*)'])
    if (existing_emails[0]['COUNT(*)'] === 0) {
        console.log('entre 1')
        return true
    } else {
        console.log('entre 2')
        return false
    }
}