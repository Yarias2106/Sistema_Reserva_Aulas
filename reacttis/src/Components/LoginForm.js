import React from 'react';
import '../App'
import '../css/logForm.css'

class LoginForm extends React.Component {
    render() {
        return (
            <div className="row g-0 align-items-center margT">
                <div className="col-md-7 px-lg-5 px-md-5 px-sm-5 px-5">
                    <form className="row">
                        
                        <div className="col-12">
                            <h1 className="pb-lg-3 text-start colorTitulo">
                                Bienvenido al Gestor de Reserva de Áulas Munay
                            </h1>
                        </div>

                        <div className="col-12">
                            <p className="pb-lg-1 mt-4 mb-4 text-start colorP">
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Odit maxime sapiente quia labore architecto, ducimus voluptates cupiditate assumenda, ea fuga ipsa, sit dolores asperiores porro molestias reiciendis beatae doloremque earum.
                            </p>
                        
                        </div>

                        <div className='row test'>
                            <div className="col-md-12 col-lg-6 col-sm-12 col-xl-5 mb-3">
                                <input type="text" className="form-control textInp" id="inputCity" placeholder="Email" />
                            </div>
                            <div className="col-md-12 col-lg-6 col-sm-12 col-xl-4 mb-3">
                                <input type="text" className="form-control textInp" id="inputCity" placeholder="Contraseña" />
                            </div>
                            <div className="col-lg-12 col-xl-3 test">
                                <button type="submit" className="btn w-75 btnCol">Sign in</button>
                            </div>
                        </div>
                        

                    </form>
                </div>

                <div className="col-md-5 col-sm-12 col-12 ps-0 mt-5 pe-lg-5">
                    <img src="https://ed.team/images/utils/semana-de-la-tecnologia/grafico.png" alt="" className='imagen'></img>
                </div>
            </div>
        );
    }
}

export default LoginForm;