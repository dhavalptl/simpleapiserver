import express from 'express';
import helmet from 'helmet';
import compression from 'compression';

const app = express();

app.use(compression());
app.use(helmet());
app.use('/', express.static('public'));
app.use(express.json());

app.use('/greetings', (req, res) => {
    res.status(200).json({
        message: "Welcome to application",
        date: new Date().toLocaleString()
    })
});

export default app;